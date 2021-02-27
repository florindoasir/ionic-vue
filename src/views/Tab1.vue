<template>
  <ion-page>
    <ion-header>
      <ion-toolbar>
        <ion-title>Tab 1</ion-title>
      </ion-toolbar>
    </ion-header>
    <ion-content :fullscreen="true">
      <ion-header collapse="condense">
        <ion-toolbar>
          <ion-title size="large">Tab 1</ion-title>
        </ion-toolbar>
      </ion-header>

      <ExploreContainer name="Tab 1 page" />
    </ion-content>
  </ion-page>
</template>

<script lang="ts">
import { IonPage, IonHeader, IonToolbar, IonTitle, IonContent } from '@ionic/vue';
import ExploreContainer from '@/components/ExploreContainer.vue';

export default  {
  name: 'Tab1',
  components: { ExploreContainer, IonHeader, IonToolbar, IonTitle, IonContent, IonPage },
  data(){
    return {
      jsonObject: {}
    };
  },
  created() {
    this.init();
  },
  methods: {
    init() {
      fetch("https://raw.githubusercontent.com/Arrako23/LDM/master/PR%C3%81CTICAS/P-2-LDM-2/ocio.json")
      .then(response => response.json())
      .then(data => (this.jsonObject = data));
    }
  }
}
</script>