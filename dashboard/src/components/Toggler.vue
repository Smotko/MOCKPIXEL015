<template>
  <card v-bind:title="title"
        v-bind:content="statusTexts[+active]"
        v-bind:status="statusStyles[+active]">
    <a class="button" v-on:click="toggle" v-if="!!buttonTexts[+active]">
      {{buttonTexts[+active]}}
    </a>
    <slot></slot>
  </card>
</template>

<script>
import Card from '@/components/Card'
export default {
  name: 'toggler',
  components: {
    Card
  },
  methods: {
    toggle () {
      this.$emit('toggled', !this.active)
    }
  },
  props: [
    'title',
    'statusTexts',
    'statusStyles',
    'buttonTexts',
    'active'
  ]
}
</script>
