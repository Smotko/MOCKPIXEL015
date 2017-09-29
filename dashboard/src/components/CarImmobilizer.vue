<template>
    <toggler title="Immobilizer"
             v-bind:statusTexts="['Disengaged', 'Engaged']"
             v-bind:statusStyles="['', 'is-danger']"
             v-bind:buttonTexts="['Engage', 'Disengage']"
             v-bind:active="immobilizer"
             v-bind:loading="loading"
             v-on:toggled="toggle">
             <modal title="Confirm"
                    acceptButton="Engage immobilizer"
                    acceptClass="is-danger"
                    :shown="modalShown"
                    v-on:cancel="modalShown = false"
                    v-on:accept="modalDone">
               Are you sure you want to immobilize your car?
             </modal>
    </toggler>
</template>

<script>
import Modal from '@/components/Modal'
import Toggler from '@/components/Toggler'
export default {
  name: 'carimmobilizer',
  components: {
    Modal,
    Toggler
  },
  data () {
    return {
      immobilizer: false,
      modalShown: false,
      loading: false
    }
  },
  methods: {
    toggle (enabled) {
      if (enabled) {
        this.modalShown = true
      } else {
        this.loading = true
        this.immobilizer = false
        setTimeout(() => {
          this.loading = false
        }, 400)
        this.immobilizer = false
      }
    },
    modalDone () {
      this.immobilizer = true
      this.modalShown = false
      this.loading = true
      setTimeout(() => {
        this.loading = false
      }, 400)
    }
  }
}
</script>
