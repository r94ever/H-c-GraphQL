import { userLogin } from "@/graphql/mutations/user.gql"
import { me } from "@/graphql/queries/user.gql"

export default class ApolloScheme {


  constructor(auth, options) {

    this.$auth = auth

    this.$apollo = auth.ctx.app.apolloProvider.defaultClient
    this.$apolloHelpers = auth.ctx.app.$apolloHelpers
    this.$dialog = auth.ctx.$dialog
    this.name = options._name
  }

  async login({ data }) {
    try {
      let result = await this.$apollo
        .mutate({
          mutation: userLogin,
          variables: data,
        })
      
      // console.log(result, Object.values(result.data)[0]);

      await this.setToken(Object.values(result.data)[0])
      await this.$auth.redirect('home', true)

    } catch (errors) {
      console.log(errors);
    }
  }


  async setToken({ access_token }) {
    // await this.$auth.setUserToken(access_token)
    await this.$apolloHelpers.onLogin(access_token)
  }

  async setUser(user) {
    await this.$auth.setUser(user)
  }


  _checkToken() {
    let status = !this.$apolloHelpers.getToken() || this.$apolloHelpers.getToken() === this.name

    return !status;
  }


  async fetchUser() {

    // console.log('lay user');

    if (!this._checkToken()) return

    // console.log('Fetch user detail');

    let { data } = await this.$apollo.query({ query: me })

    await this.setUser(Object.values(data)[0])
  }

  async logout() {
    // await this.$apollo.mutate({ mutation: userLogout, variables: { id: this.$auth.user.id }})
    await this.$auth.setUser(null)
    await this.$auth.setToken(null)

    await this.$apolloHelpers.onLogout(undefined, true)
    await this.$auth.setUser(null)
    await this.$auth.redirect('admin_logout', true)
  }


  // async logout() {
  //   await this.$apolloHelpers.onLogout(undefined, true)
  //   await this.$auth.setUser(null)
  // }

}
