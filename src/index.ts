import { NativeModules } from 'react-native';

const { CloudPicker: RCTCloudPicker } = NativeModules;

export default class CloudPicker { 
    public static pickDropBoxFile(appKey: string): Promise<string> {
        return RCTCloudPicker.pickDropBoxFile(appKey);
    }
}