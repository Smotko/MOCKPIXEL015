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
        fetch('/api/set_immobilizer', {
          method: 'POST',
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json'
          },
          body: JSON.stringify({immobilizer: +this.immobilizer})
        }).then(() => {
          this.loading = false
        }).catch(() => {
          console.log('Something went wrong')
          this.immobilizer = !this.immobilizer
          this.loading = false
        })
      }
    },
    modalDone () {
      this.immobilizer = true
      this.modalShown = false
      this.loading = true
      fetch('/api/set_immobilizer', {
        method: 'POST',
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        },
        body: JSON.stringify({immobilizer: +this.immobilizer})
      }).then(() => {
        this.loading = false
      }).catch(() => {
        console.log('Something went wrong')
        this.immobilizer = !this.immobilizer
        this.loading = false
      })
    }
  }
}
</script>
