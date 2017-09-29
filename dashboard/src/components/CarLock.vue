<template>
  <toggler title="Car status"
           v-bind:statusTexts="['Unlocked', 'Locked']"
           v-bind:statusStyles="['', 'is-primary']"
           v-bind:buttonTexts="['Lock', 'Unlock']"
           v-bind:initialState="true">
  </toggler>
</template>

<script>
import Toggler from '@/components/Toggler'
export default {
  name: 'carlock',
  components: {
    Toggler
  },
  props: {
    locked: {
      type: Boolean,
      default: true
    }
  },
  data () {
    return {}
  }
}
</script>
