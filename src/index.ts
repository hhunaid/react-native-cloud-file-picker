import { NativeModules } from 'react-native';

const { CloudPicker: RCTCloudPicker } = NativeModules;

type ThumbnailType = '640x480' | '64x64' | '200x200';

type CloudPickerResponse = {
  uri: string;
  thumbnails?: Record<ThumbnailType, string>;
};

export default class CloudPicker {
  public static pickDropBoxFile(appKey: string): Promise<CloudPickerResponse> {
    return RCTCloudPicker.pickDropBoxFile(appKey);
  }
}
