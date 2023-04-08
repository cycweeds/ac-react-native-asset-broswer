import * as React from 'react';

import { Image, StyleSheet, TouchableOpacity, View } from 'react-native';
import AssetBrowserManager from '@ac/react-native-asset-broswer';


export default function App() {

  let urls = ['https://img.freepik.com/free-vector/japanese-wave-line-art-landscape-background-abstract-mountain-banner-design-pattern-vector-illustration-geometric-poster_90220-715.jpg?w=1800&t=st=1680945328~exp=1680945928~hmac=76468dfa3bb86a32db2d0a594a0da6ead42b78867ab792643a738b31225b140f',
    'https://img.freepik.com/premium-vector/ocean-wave-vector-illustrations-creative-minimalist-modern-paint-line-art-print_69626-377.jpg?size=626&ext=jpg',
    'https://img.freepik.com/premium-vector/mountain-ocean-wave-line-art-creative-minimalist-hand-painted-illustrations-mid-century-modern-abstract-contemporary-aesthetic-backgrounds-landscapes_69626-535.jpg?size=626&ext=jpg'
  ]

  return (
    <View style={styles.container}>



      {urls.map((uri, index) => {
        return <TouchableOpacity
          onPress={() => {

            AssetBrowserManager.show({
              urls: urls,
              index: index.toFixed()
            })

          }}>
            <Image
          style={{
            backgroundColor: 'red',
            height: 100,
            width: 100,
            marginBottom: 20
          }}
          source={{
            uri: uri
          }}/>
        </TouchableOpacity>
      })
      }



    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  box: {
    width: 60,
    height: 60,
    marginVertical: 20,
  },
});
