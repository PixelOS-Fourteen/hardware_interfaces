/*
 * Copyright (C) 2022 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package android.hardware.wifi;

import android.hardware.wifi.WifiStatusCode;

@VintfStability
oneway interface IWifiEventCallback {
    /**
     * Called when the Wi-Fi system failed in a way that caused it be disabled.
     * Calling start again must restart Wi-Fi as if stop then start was called
     * (full state reset). When this event is received all IWifiChip & IWifiIface
     * objects retrieved after the last call to start will be considered invalid.
     *
     * @param status Failure reason code.
     */
    void onFailure(in WifiStatusCode status);

    /**
     * Called in response to a call to start indicating that the operation
     * completed. After this callback the HAL must be fully operational.
     */
    void onStart();

    /**
     * Called in response to a call to stop indicating that the operation
     * completed. When this event is received all IWifiChip objects retrieved
     * after the last call to start will be considered invalid.
     */
    void onStop();

    /**
     * Must be called when the Wi-Fi subsystem restart completes.
     * Once this event is received, framework must fully reset the Wi-Fi stack state.
     *
     * @param status Status code.
     */
    void onSubsystemRestart(in WifiStatusCode status);
}
