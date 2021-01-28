<template>
  <card :title="$t('your_info')">
    <form @submit.prevent="update" @keydown="form.onKeydown($event)">
      <alert-success :form="form" :message="$t('info_updated')" />

      <!-- Name -->
      <div class="form-group row">
        <label class="col-md-3 col-form-label text-md-right">{{ $t('name') }}</label>
        <div class="col-md-7">
          <input v-model="form.name" :class="{ 'is-invalid': form.errors.has('name') }" type="text" name="name" class="form-control">
          <has-error :form="form" field="name" />
        </div>
      </div>

      <!-- Email -->
      <div class="form-group row">
        <label class="col-md-3 col-form-label text-md-right">{{ $t('email') }}</label>
        <div class="col-md-7">
          <input v-model="form.email" :class="{ 'is-invalid': form.errors.has('email') }" type="email" name="email" class="form-control">
          <has-error :form="form" field="email" />
        </div>
      </div>

      <div class="form-group row">
        <label class="col-md-3 col-form-label text-md-right">{{ $t('avatar') }}</label>
        <div class="col-md-7">
          <input :class="{ 'is-invalid': form.errors.has('avatar') }" type="file" class="form-control" @change="addAvatar">
          <has-error :form="form" field="avatar" />
        </div>
      </div>

      <!-- Submit Button -->
      <div class="form-group row">
        <div class="col-md-9 ml-md-auto">
          <v-button :loading="form.busy" type="success">
            {{ $t('update') }}
          </v-button>
        </div>
      </div>
    </form>
  </card>
</template>

<script>
import Form from 'vform'
import { mapState } from 'vuex'
import { updateUser } from '../../graphql/mutations/user.gql'

export default {
  scrollToTop: false,

  data: () => ({
    form: new Form({
      name: '',
      email: '',
      avatar: null
    })
  }),

  head () {
    return { title: this.$t('settings') }
  },

  computed: {
    ...mapState({
      user: state => state.auth.user
    })
  },

  created () {
    // console.log(this.user);
    // Fill the form with user data.
    this.form['name'] = this.user.name
    this.form['email'] = this.user.email
  },

  methods: {
    addAvatar (event) {
      const File = event.target.files || event.dataTransfer.files

      if (!File.length) return

      this.form.avatar = event.target.files[0]
    },

    update () {
      // this.form.patch('/settings/profile').then(({ data: user }) => {
      //   this.$store.dispatch('auth/updateUser', { user })
      // })
      this.$apollo
        .mutate({
          mutation: updateUser,
          variables: {
            id: this.user.id,
            name: this.form.name,
            email: this.form.email,
            avatar: this.form.avatar
          }
        })
        .then(res => console.log(res))
    }
  }
}
</script>
