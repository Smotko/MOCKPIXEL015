<template>
  <toggler title="Parental controls"
           v-bind:statusTexts="['Off', 'On']"
           v-bind:statusStyles="['is-warning', 'is-primary']"
           v-bind:buttonTexts="['Turn On', 'Turn Off']"
           v-bind:initialState="false">
  </toggler>
</template>

<script>
import Toggler from '@/components/Toggler'
export default {
  name: 'carparentalcontrol',
  components: {
    Toggler
  },
  props: {
    enabled: {
      type: Boolean,
      default: true
    }
  },
  data () {
    return {}
  }
}
</script>
