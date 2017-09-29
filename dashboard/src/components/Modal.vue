<template>
  <div class="modal" :class="{ 'is-active': shown }"
                     @keyup.enter="accept"
                     @keyup.esc="cancel">
    <div class="modal-background" v-on:click="cancel"></div>
    <div class="modal-content">
      <header class="modal-card-head">
        <p class="modal-card-title">{{title}}</p>
        <button class="delete" aria-label="close" v-on:click="cancel"></button>
      </header>
      <section class="modal-card-body">
        <slot></slot>
      </section>
      <footer class="modal-card-foot">
        <button class="button is-success" v-on:click="accept">Save changes</button>
      </footer>
    </div>
  </div>
</template>

<script>
export default {
  name: 'modal',
  props: [
    'title',
    'shown'
  ],
  data () {
    return {}
  },
  created: function () {
    window.addEventListener('keyup', this.keyup)
  },
  destroyed: function () {
    window.removeEventListener('keyup', this.keyup)
  },
  methods: {
    cancel () {
      this.$emit('cancel')
    },
    accept () {
      this.$emit('accept')
    },
    keyup (ev) {
      if (!this.shown) {
        return
      }
      if (ev.which === 13) {
        this.accept()
      } else if (ev.which === 27) {
        this.cancel()
      }
    }
  }
}
</script>
