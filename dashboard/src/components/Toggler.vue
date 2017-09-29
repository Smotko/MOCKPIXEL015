<template>
  <card v-bind:title="title"
        v-bind:content="statusTexts[+enabled]"
        v-bind:status="statusStyles[+enabled]">
    <a class="button" v-on:click="enabled = !enabled">
      {{buttonTexts[+enabled]}}
    </a>
  </card>
</template>

<script>
import Card from '@/components/Card'
export default {
  name: 'toggler',
  components: {
    Card
  },
  props: [
    'title',
    'statusTexts',
    'statusStyles',
    'buttonTexts',
    'initialState'
  ],
  data () {
    return {
      enabled: !!this.initialState
    }
  }
}
</script>
