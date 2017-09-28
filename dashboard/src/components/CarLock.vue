<template>
  <card title="Car status" v-bind:content="locked ? 'Locked' : 'Unlocked'" v-bind:status="locked ? 'is-primary' : ''">
    <a v-if="locked" class="button"  v-on:click="locked = !locked">Unlock</a>
    <a v-else="locked" class="button" v-on:click="locked = !locked">Lock</a>
  </card>
</template>

<script>
import Card from '@/components/Card'
export default {
  name: 'carlock',
  components: {
    Card
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
