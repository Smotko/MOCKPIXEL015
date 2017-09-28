<template>
  <div>
    <NavBar></NavBar>
    <Content></Content>
  </div>
</template>

<script>
import Card from '@/components/Card'
import NavBar from '@/components/NavBar'
import Content from '@/components/Content'
export default {
  name: 'dashboard',
  components: {
    NavBar,
    Card,
    Content
  },
  data () {
    return {
      msg: 'Welcome to Your Vue.js App'
    }
  }
}
</script>
