<template>
  <card title="Parental control" v-bind:content="enabled ? 'On' : 'Off'" v-bind:status="enabled ? 'is-primary' : 'is-warning'">
    <a v-if="enabled" class="button"  v-on:click="enabled = !enabled">Turn Off</a>
    <a v-else="enabled" class="button" v-on:click="enabled = !enabled">Turn On</a>
  </card>
</template>

<script>
import Card from '@/components/Card'
export default {
  name: 'carparentalcontrol',
  components: {
    Card
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
