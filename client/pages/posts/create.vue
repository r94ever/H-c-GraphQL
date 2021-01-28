<template>
  <div>
    <PostForm
      :post="{
        author: {},
        categories: []
      }"
      @on-submit="savePost"
    />
  </div>
</template>

<script>
import PostForm from '../../components/post/PostForm'
import { createPost } from '../../graphql/mutations/user.gql'
import { mapGetters } from 'vuex'

export default {
  components: {
    PostForm,
  },

  computed: mapGetters({
    user: state => state.auth.user
  }),

  methods: {
    savePost (data) {
      this.$apollo
        .mutate({ mutation: createPost, variables: data })
        .then(res => this.$router.push({ name: 'posts-edit', params: {id: res.data.createPost.id }}))
    }
  },
}
</script>
