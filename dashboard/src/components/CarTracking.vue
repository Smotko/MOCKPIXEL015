<template>
  <toggler title="Tracking"
           v-bind:statusTexts="['Inactive', 'Active']"
           v-bind:statusStyles="['is-warning', 'is-primary']"
           v-bind:buttonTexts="['Activate', 'Diactivate']"
           v-bind:active="tracking"
           v-on:toggled="tracking = !tracking">
  </toggler>
</template>

<script>
import Toggler from '@/components/Toggler'
export default {
  name: 'carlock',
  components: {
    Toggler
  },
  data () {
    return {
      tracking: false
    }
  }
}
</script>
