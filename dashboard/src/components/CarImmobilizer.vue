<template>
    <toggler title="Immobilizer"
             v-bind:statusTexts="['Disengaged', 'Engaged']"
             v-bind:statusStyles="['', 'is-danger']"
             v-bind:buttonTexts="['Engage', 'Disengage']"
             v-bind:active="immobilizer"
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
      modalShown: false
    }
  },
  methods: {
    toggle (enabled) {
      if (enabled) {
        this.modalShown = true
      } else {
        this.immobilizer = false
      }
    },
    modalDone () {
      this.immobilizer = true
      this.modalShown = false
    }
  }
}
</script>
