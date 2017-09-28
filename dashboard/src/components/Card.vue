<template>
  <div class="tile is-parent">
    <article class="tile is-child notification" v-bind:class="[status]">
      <p class="subtitle">{{title}}</p>
      <p class="title">{{content}}</p>
    </article>
  </div>
</template>

<script>
export default {
  name: 'card',
  props: ['title', 'content', 'status'],
  data () {
    return {}
  }
}
</script>
