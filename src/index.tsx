import {NativeModules} from 'react-native';
const {AssetBrowserManager} = NativeModules;

export type AssetBroswerProps = {
  urls: string[],
  index?: number
}

interface AssetBrowserManagerInterface {
 show:(props: AssetBroswerProps) => void
}

export default AssetBrowserManager as AssetBrowserManagerInterface