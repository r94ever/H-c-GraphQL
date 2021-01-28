<template>
  <div>
    <CategoryForm
      :category="{}"
      @on-submit="saveCategory"
    />
  </div>
</template>

<script>
import CategoryForm from '../../components/category/CategoryForm'
import { createCategory } from '../../graphql/mutations/user.gql'

export default {
  components: {
    CategoryForm,
  },

  methods: {
    saveCategory (data) {
      this.$apollo
        .mutate({ mutation: createCategory, variables: data })
        .then(res => this.$router.push({ name: 'categories-edit', params: {id: res.data.createCategory.id }}))
    }
  },
}
</script>
