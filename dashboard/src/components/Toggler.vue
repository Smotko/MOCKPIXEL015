<template>
  <card v-bind:title="title"
        v-bind:content="statusTexts[+active]"
        v-bind:status="statusStyles[+active]">
    <a class="button"
       v-bind:disabled="loading"
       v-bind:class="{'is-loading': loading}"
       v-on:click="toggle"
       v-if="!!buttonTexts[+active]">
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
      if (this.loading) {
        return
      }
      this.$emit('toggled', !this.active)
    }
  },
  props: [
    'title',
    'statusTexts',
    'statusStyles',
    'buttonTexts',
    'active',
    'loading'
  ]
}
</script>
