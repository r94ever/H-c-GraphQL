<template>
  <form @submit.prevent="$emit('on-submit', form)">
    <div class="form-group row">
      <label class="col-sm-2 col-form-label" for="title">Title</label>
      <div class="col-sm-10">
        <input v-model="form.title" class="form-control" id="title">
        <small id="title" class="form-text text-muted">Enter post title</small>
      </div>
    </div>
    <div class="form-group row">
      <label class="col-sm-2 col-form-label" for="content">Content</label>
      <div class="col-sm-10">
        <textarea v-model="form.content" rows="8" class="form-control" id="content" />
      </div>
    </div>
    <div class="form-group row">
      <label class="col-sm-2 col-form-label" for="author">Author</label>
      <div class="col-sm-10">
        <select v-model="author_id" class="custom-select" id="author">
          <option selected>Choose...</option>
          <option
            v-for="user in users"
            :key="user.id"
            :value="user.id"
          >
            {{ user.name }}
          </option>
        </select>
      </div>
    </div>
    <div class="form-group row">
      <label class="col-sm-2 col-form-label" for="status">Status</label>
      <div class="col-sm-10">
        <select v-model="form.status" class="custom-select" id="status">
          <option selected>Choose...</option>
          <option value="DRAFT">Draft</option>
          <option value="PUBLISHED">Published</option>
        </select>
      </div>
    </div>
    <div class="form-group row">
      <label class="col-sm-2 col-form-label" for="status">Categories</label>
      <div class="col-sm-10">
        <select v-model="category_ids" class="custom-select" id="categories" multiple>
          <option selected>Select categories...</option>
          <option
            v-for="(category, index) in categories"
            :key="index"
            :value="category.id"
            v-text="category.name"
          />
        </select>
      </div>
    </div>
    <button type="submit" class="btn btn-primary">Submit</button>
    <button class="btn btn-secondary" @click.prevent="$router.push({ name: 'posts-index' })">Cancel</button>
  </form>
</template>

<script>
import { getUsers, getCategories } from '../../graphql/queries/user.gql'

export default {
  props: {
    post: {
      type: Object,
      default: () => ({})
    },
  },

  apollo: {
    users: {
      query: getUsers
    },
    categories: {
      query: getCategories
    }
  },

  data() {
    return {
      form: {},
      users: [],
      categories: []
    }
  },

  computed: {
    author_id: {
      get () {
        return this.post.author.id
      },
      set (value) {
        this.form.user_id = value
      }
    },

    category_ids: {
      get () {
        return this.post.categories.map(c => c.id)
      },
      set (value) {
        this.form.categories = value.map(id => parseInt(id))
      }
    }
  },

  created () {
    this.form = Object.assign({}, this.post)
  },
}
</script>
