<template>
  <div>
    <div class="row mb-4">
      <div class="col text-right">
        <button class="btn btn-primary" @click.prevent="$router.push({ name: 'categories-create' })">New Category</button>
      </div>
    </div>
    <table v-if="categories.length > 0" class="table">
      <thead>
        <tr>
          <th scope="col">#</th>
          <th scope="col">Name</th>
          <th scope="col">Posts count</th>
          <th scope="col"></th>
        </tr>
      </thead>
      <tbody>
        <tr
          v-for="category in categories"
          :key="category.id"
        >
          <th scope="row">{{ category.id }}</th>
          <td>{{ category.name }}</td>
          <td>{{ category.total_posts }}</td>
          <td class="text-right">
            <button class="btn btn-primary" @click.prevent="$router.push({ name: 'categories-edit', params: {id: category.id }})">Edit</button>
            <button class="btn btn-danger" @click.prevent="delCat(category.id)">Delete</button>
          </td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
import { getCategories } from '../../graphql/queries/user.gql'
import { deleteCategory } from '../../graphql/mutations/user.gql'

export default {
  apollo: {
    categories: {
      fetchPolicy: 'network-only',
      debounce: 350,
      query: getCategories
    }
  },

  data: () => ({
    categories: [],
    current_page: 1
  }),

  methods: {
    delCat (catId) {
      if (window.confirm('Deleting confirmation')) {
        this.$apollo.mutate({
          mutation: deleteCategory,
          variables: { id: catId }
        })
        .then(res => {
          alert('Deleted')
          this.$apollo.queries.categories.refresh()
        })
        .catch(errors => console.log(errors))
      }
    }
  },
}
</script>
