<template>
  <post-form
    v-if="post.id"
    :post="post"
    @on-submit="save"
  />
</template>

<script>
import PostForm from '../../components/post/PostForm.vue'
import { getPost } from '../../graphql/queries/user.gql'
import { updatePost } from '../../graphql/mutations/user.gql'

export default {
  components: { PostForm },

  apollo: {
    post: {
      query: getPost,
      variables () {
        return { id: this.$route.params.id }
      }
    },
  },

  data: () => ({
    post: {
      author: {},
      categories: []
    },
  }),

  methods: {
    save (data) {
      this.$apollo.mutate({
        mutation: updatePost,
        variables: {
          ...data,
          user_id: this.post.author.id
        }
      })
    }
  },
}
</script>
