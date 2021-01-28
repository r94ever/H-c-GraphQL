<template>
  <div class="row">
    <div class="col-4">
      <div class="list-group">
        <a
          v-for="user in users"
          :key="user.id"
          class="list-group-item list-group-item-action"
          :class="{'active': current_receiver.id === user.id}"
          href="javascript:;"
          @click.prevent="current_receiver = user"
        >
          {{ user.name }}
        </a>
      </div>
    </div>

    <div class="col-8">
      <div class="chatbox" style="">
        <div class="chat-messages" id="chatbox" style="border: 1px solid black; height: 200px; overflow-y: scroll; padding: 15px">
          <div class="chat-message" v-for="chat in chats" :key="chat.id" style="margin-bottom: 2px; font-size: 20px">
            <div v-if="chat.sender_id == $auth.user.id" class="my-message text-right">
              <span style="background: #007bff; border-radius: 40px; padding: 8px 18px; color: #fff">{{ chat.message }}</span><br /><small>{{ chat.status }}</small>
            </div>
            <div v-else class="friend-message">
              <span style="background: #007bff; border-radius: 40px; padding: 8px 18px; color: #fff">{{ chat.message }}</span><br /><small>{{ chat.status }}</small>
            </div>
          </div>
        </div>
        <div class="chat-input " style="border: 1px solid black;">
          <form @submit.prevent="sendMessage">
            <div class="input-group mb-3">
              <input v-model="message" class="form-control" placeholder="Enter message" :disabled="!current_receiver.id">
              <div class="input-group-append">
                <button class="btn btn-outline-secondary" type="submit" :disabled="sending || !current_receiver.id">Send</button>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import Echo from 'laravel-echo'
import { getUsers, getChats } from '../graphql/queries/user.gql'
import { sendMessage } from '../graphql/mutations/user.gql'
import Cookie from 'js-cookie'

const Pusher = require('pusher-js')

Pusher.logToConsole = true

// const LEcho = new Echo({
//   broadcaster: 'pusher',
//   key: '58d0ee4ff17356d78f7f',
//   cluster: 'ap1',
//   forceTLS: true,
//   client: Pusher,
//   authEndpoint: '/broadcasting/auth'
// })

function scrollToEndChatScreen () {
  const ChatBox = document.getElementById('chatbox')

  ChatBox.scrollTop = ChatBox.scrollHeight
}

export default {
  middleware: 'auth',

  apollo: {
    users: {
      query: getUsers
    }
  },

  data  () {
    return {
      users: [],
      current_receiver: '',
      chats: [],
      message: null,
      sending: false
    }
  },

  created () {
    let pusher = new Pusher('58d0ee4ff17356d78f7f', {
      cluster: 'ap1',
      authEndpoint: 'http://localhost:8000/broadcasting/auth',
      auth: {
        headers: {
          'Authorization': "Bearer " + Cookie.get('apollo-token')
        }
      }
    })

    const Channel = pusher.subscribe(`private-chat.${this.$auth.user.id}`)

    Channel.bind('App\\Events\\MessageSent', data => {
      this.chats.push(data.chat)
      scrollToEndChatScreen()
    })
  },

  watch: {
    'current_receiver'(value) {
      if (value.id) {
        this.chats = []
        this.getChat(value.id)
      }
    }
  },

  methods: {
    getChat (userId) {
      this.$apollo.mutate({
        mutation: getChats,
        variables: { receiverId: Number(userId), senderId: Number(this.$auth.user.id) }
      })
      .then(res => {
        this.chats = res.data.chats
        setTimeout(() => scrollToEndChatScreen(), 500)
      })
    },

    sendMessage () {
      const ID = Math.random()

      this.chats.push({
        id: ID,
        sender_id: this.$auth.user.id,
        receiver_id: this.current_receiver.id,
        message: this.message,
        status: 'sending',
        created_at: new Date().toISOString()
      })

      this.sending = true

      this.$apollo
        .mutate({
          mutation: sendMessage,
          variables: {
            receiverId: Number(this.current_receiver.id),
            message: this.message
          }
        })
        .then(res => {
          const Index = this.chats.findIndex(chat => chat.id === ID)

          this.$set(this.chats[Index], 'status', 'sent')
          this.$set(this.chats[Index], 'id', res.data.sendMessage.id)

          scrollToEndChatScreen()
        })
        .catch(error => {
          const Index = this.chats.findIndex(chat => chat.id === ID)

          this.$set(this.chats[Index], 'status', 'error')

          scrollToEndChatScreen()
        })
        .finally(() => {
          this.sending = false
        })
    },
  },
}
</script>
