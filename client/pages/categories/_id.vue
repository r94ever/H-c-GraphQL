<template>
  <CategoryForm
    v-if="category.id"
    :category="category"
    @on-submit="save"
  />
</template>

<script>
import CategoryForm from '../../components/category/CategoryForm'
import { getCategory } from '../../graphql/queries/user.gql'
import { updateCategory } from '../../graphql/mutations/user.gql'

export default {
  components: { CategoryForm },

  apollo: {
    category: {
      query: getCategory,
      variables () {
        return { id: this.$route.params.id }
      }
    },
  },

  data: () => ({
    category: {},
  }),

  methods: {
    save (data) {
      this.$apollo.mutate({
        mutation: updateCategory,
        variables: data
      })
    }
  },
}
</script>
