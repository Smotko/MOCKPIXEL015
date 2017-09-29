<template>
  <toggler title="Immobilizer"
           v-bind:statusTexts="['Disengaged', 'Engaged']"
           v-bind:statusStyles="['', 'is-danger']"
           v-bind:buttonTexts="['Engage', 'Disengage']"
           v-bind:active="immobilizer"
           v-on:toggled="immobilizer = !immobilizer">
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
      immobilizer: false
    }
  }
}
</script>
