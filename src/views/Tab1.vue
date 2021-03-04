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


      <ion-card>
        <ion-item>
          <ion-icon icon="pin" slot="start"></ion-icon>
          <ion-label>{{info.Ciudad}}</ion-label>
          <ion-button fill="outline" slot="end">{{info.Comunidad}}</ion-button>
        </ion-item>

        <ion-card-content>
          Bares
          <ion-list>
            <ion-item :key="key" v-for="(bar,key) in info.Bares">
              <ion-label>{{bar.Nombre}}</ion-label>
            </ion-item>
          </ion-list>
          Ocio
          <ion-list>
            <ion-item :key="key" v-for="(bar,key) in info.Ocio">
              <ion-label>{{bar.Nombre}}</ion-label>
            </ion-item>
          </ion-list>
        </ion-card-content>
      </ion-card>
    </ion-content>
  </ion-page>
</template>

<script >
import { IonPage, IonHeader, IonToolbar, IonTitle, IonContent } from '@ionic/vue';
import axios from "axios";

export default  {
  name: 'Tab1',
  components: { IonHeader, IonToolbar, IonTitle, IonContent, IonPage },
  data(){
    return {
      info: null,
      loading: true,
      errored: false
    }
  },
  mounted  () {
      axios
      .get('https://raw.githubusercontent.com/Arrako23/LDM/master/PR%C3%81CTICAS/P-2-LDM-2/ocio.json')
      .then(response => {
        this.info = response.data;
      })
      .catch(error => {
        console.log(error)
        this.errored = true
      })
      .finally(() => this.loading = false)
  },
  methods: {
  }
}
</script>