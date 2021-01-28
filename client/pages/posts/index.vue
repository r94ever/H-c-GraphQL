<template>
  <div>
    <div class="row mb-4">
      <div class="col text-right">
        <button class="btn btn-primary" @click.prevent="$router.push({ name: 'posts-create' })">New Post</button>
      </div>
    </div>
    <nav class="navbar navbar-light bg-light">
      <form class="form-inline" @submit.prevent="$apollo.queries.posts.refetch()">
        <input class="form-control mr-sm-2" v-model="filters.keyword">
        <select class="form-control mr-sm-2" v-model="filters.status">
          <option :value="null">-- Status Filter</option>
          <option value="0">Draft</option>
          <option value="1">Published</option>
        </select>
        <select class="form-control mr-sm-2" v-model="filters.category_id">
          <option selected>Category Filter...</option>
            <option
              v-for="(category, index) in categories"
              :key="index"
              :value="category.id"
              v-text="category.name"
            />
        </select>
        <button class="btn btn-secondary my-2 my-sm-0" @click.prevent="clearFilter">Clear</button>
      </form>
    </nav>
    <table v-if="posts.data.length > 0" class="table">
      <thead>
        <tr>
          <th scope="col">#</th>
          <th scope="col">Title</th>
          <th scope="col">Categories</th>
          <th scope="col">Author</th>
          <th scope="col">Status</th>
          <th scope="col"></th>
        </tr>
      </thead>
      <tbody>
        <tr
          v-for="post in posts.data"
          :key="post.id"
        >
          <th scope="row">{{ post.id }}</th>
          <td>{{ post.title }}</td>
          <td>{{ post.categories.map(cat => cat.name).join(', ') }}</td>
          <td>{{ post.author.name }}</td>
          <td>
            <span v-if="post.status === 'PUBLISHED'" class="badge badge-success">Published</span>
            <span v-else class="badge badge-secondary">Draft</span>
          </td>
          <td>
            <button class="btn btn-primary" @click.prevent="$router.push({ name: 'posts-edit', params: {id: post.id }})">Edit</button>
            <button class="btn btn-danger" @click.prevent="delPost(post.id)">Delete</button>
          </td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
import { getPosts, getCategories } from '../../graphql/queries/user.gql'
import { deletePost } from '../../graphql/mutations/user.gql'

export default {
  apollo: {
    posts: {
      fetchPolicy: 'network-only',
      debounce: 350,
      query: getPosts,
      variables () {
        let statusCondition,
            categoryCondition,
            keywordCondition,
            conditions = { AND: [] },
            filters = {
              first: 10,
              page: this.current_page,
            }

        if (Object.keys(this.filters).length === 0 && this.filters.constructor === Object) {
          return filters
        }

        if (this.filters.status) {
          statusCondition = { column: 'STATUS', operator: 'EQ', value: this.filters.status }
        }

        if (this.filters.category_id) {
          categoryCondition = {
            column: 'ID',
            operator: 'EQ',
            value: this.filters.category_id
          }
        }

        if (this.filters.keyword) {
          keywordCondition = {
            OR: [
              { column: 'TITLE', operator: 'LIKE', value: `%${this.filters.keyword}%` },
              { column: 'CONTENT', operator: 'LIKE', value: `%${this.filters.keyword}%` }
            ]
          }
        }

        [statusCondition, keywordCondition].forEach((condition, index) => {
          if (condition) conditions.AND.push(condition)
        })

        return {
          first: 10,
          page: this.current_page,
          where: conditions,
          hasCategories: categoryCondition
        }
      }
    },
    categories: {
      query: getCategories,
    }
  },

  data: () => ({
    filters: {},
    posts: {
      data: [],
      paginatorInfo: {}
    },
    categories: [],
    current_page: 1
  }),

  methods: {
    delPost (postId) {
      if (window.confirm('Deleting confirmation')) {
        this.$apollo.mutate({
          mutation: deletePost,
          variables: { id: postId }
        })
        .then(res => {
          alert('Deleted')
          this.$apollo.queries.posts.refresh()
        })
        .catch(errors => console.log(errors))
      }
    },

    clearFilter () {
      this.$set(this, 'filters', {})
    }
  },
}
</script>
