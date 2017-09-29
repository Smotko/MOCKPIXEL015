<template>
  <div>
    <nav-bar></nav-bar>
    <dashboard-content></dashboard-content>
  </div>
</template>

<script>
import Card from '@/components/Card'
import NavBar from '@/components/NavBar'
import DashboardContent from '@/components/DashboardContent'
export default {
  name: 'dashboard',
  components: {
    NavBar,
    Card,
    DashboardContent
  },
  data () {
    return {
      msg: 'Welcome to Your Vue.js App'
    }
  }
}
</script>
