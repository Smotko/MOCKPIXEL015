<template>
  <toggler title="Scheduler"
           v-bind:statusTexts="['Not set', 'Active']"
           v-bind:statusStyles="['', 'is-primary']"
           v-bind:buttonTexts="['Set', 'Edit schedule']"
           v-bind:active="enabled"
           v-bind:loading="loading"
           v-on:toggled="onToggled">
    <div class="scheduleNum">
      <p class="subtitle" v-if="numScheduled > 1">
        {{numScheduled}} schedules set.
      </p>
      <p class="subtitle" v-if="numScheduled == 1">
        One schedule set.
      </p>
    </div>
    <modal title="Set schedule"
           acceptButton="Save"
           acceptClass="is-primary"
           :shown="modalShown"
           v-on:cancel="modalShown = false"
           v-on:accept="modalDone">
      <schedule-setter :schedule="[]" v-on:update="onUpdate"></schedule-setter>
    </modal>

  </toggler>
</template>

<script>
import Toggler from '@/components/Toggler'
import Modal from '@/components/Modal'
import ScheduleSetter from '@/components/ScheduleSetter'
export default {
  name: 'scheduler',
  components: {
    Modal,
    Toggler,
    ScheduleSetter
  },
  data () {
    return {
      modalShown: false,
      enabled: false,
      loading: false,
      numScheduled: 0,
      schedule: []
    }
  },
  methods: {
    onToggled (value) {
      this.modalShown = true
    },
    modalDone () {
      this.modalShown = false
      this.numScheduled = this.schedule.length
      if (this.schedule.length) {
        this.enabled = true
      } else {
        this.enabled = false
      }
      this.loading = true
      setTimeout(() => {
        this.loading = false
      }, 500)
    },
    onUpdate (value) {
      this.schedule = value
    }
  }
}
</script>

<style>
.scheduleNum {
  padding-top: 20px;
}
</style>
