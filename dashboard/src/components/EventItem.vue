<template>
  <article>
    <i v-if="type == 'info'" class="fa fa-info-circle" aria-hidden="true"></i>
    <i v-else-if="type == 'warning'" class="fa fa-exclamation-triangle has-text-warning" aria-hidden="true"></i>
    <small>{{time}} ago</small> {{info}}
  </article>
</template>

<script>
export default {
  name: 'eventitem',
  props: ['time', 'info', 'type']
}
</script>
