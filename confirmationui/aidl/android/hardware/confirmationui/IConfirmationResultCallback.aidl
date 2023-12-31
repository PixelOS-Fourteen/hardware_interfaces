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

package android.hardware.confirmationui;

import android.hardware.confirmationui.IConfirmationUI;

/**
 * Callback interface passed to IConfirmationUI::promptUserConfirmation().
 * Informs the caller about the result of the prompt operation.
 */
@VintfStability
interface IConfirmationResultCallback {
    /**
     * This callback is called by the confirmation provider when it stops prompting the user.
     * Iff the user has confirmed the prompted text, error is IConfirmationUI::OK and the
     * parameters formattedMessage and confirmationToken hold the values needed to request
     * a signature from keymaster.
     * In all other cases formattedMessage and confirmationToken must be of length 0.
     *
     * @param error - IConfirmationUI::OK: IFF the user has confirmed the prompt.
     *              - IConfirmationUI::CANCELED: If the user has pressed the cancel button.
     *              - IConfirmationUI::ABORTED: If IConfirmationUI::abort() was called.
     *              - IConfirmationUI::SYSTEM_ERROR: If an unexpected System error occurred that
     * prevented the TUI from being shut down gracefully.
     *
     * @param formattedMessage holds the prompt text and extra data.
     *                         The message is CBOR (RFC 7049) encoded and has the following format:
     *                         CBOR_MAP{ "prompt", <promptText>, "extra", <extraData> }
     *                         The message is a CBOR encoded map (type 5) with the keys
     *                         "prompt" and "extra". The keys are encoded as CBOR text string
     *                         (type 3). The value <promptText> is encoded as CBOR text string
     *                         (type 3), and the value <extraData> is encoded as CBOR byte string
     *                         (type 2). The map must have exactly one key value pair for each of
     *                         the keys "prompt" and "extra". Other keys are not allowed.
     *                         The value of "prompt" is given by the proptText argument to
     *                         IConfirmationUI::promptUserConfirmation and must not be modified
     *                         by the implementation.
     *                         The value of "extra" is given by the extraData argument to
     *                         IConfirmationUI::promptUserConfirmation and must not be modified
     *                         or interpreted by the implementation.
     *
     * @param confirmationToken a 32-byte HMAC-SHA256 value, computed over
     *                          "confirmation token" || <formattedMessage>
     *                          i.e. the literal UTF-8 encoded string "confirmation token", without
     *                          the "", concatenated with the formatted message as returned in the
     *                          formattedMessage argument. The HMAC is keyed with a 256-bit secret
     *                          which is shared with Keymaster. In test mode the test key MUST be
     *                          used (see TestModeCommands.aidl and
     * IConfirmationUI::TEST_KEY_BYTE).
     */
    void result(in int error, in byte[] formattedMessage, in byte[] confirmationToken);
}
