<template>
  <form @submit.prevent="$emit('on-submit', form)">
    <div class="form-group row">
      <label class="col-sm-2 col-form-label" for="name">Name</label>
      <div class="col-sm-10">
        <input v-model="form.name" class="form-control" id="name">
        <small class="form-text text-muted">Enter category name</small>
      </div>
    </div>
    <button type="submit" class="btn btn-primary">Submit</button>
    <button class="btn btn-secondary" @click.prevent="$router.push({ name: 'categories-index' })">Cancel</button>
  </form>
</template>

<script>
export default {
  props: {
    category: {
      type: Object,
      default: () => ({})
    },
  },

  data() {
    return {
      form: {}
    }
  },

  created () {
    this.form = Object.assign({}, this.category)
  },
}
</script>
