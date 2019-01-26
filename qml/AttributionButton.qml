/* -*- coding: utf-8-unix -*-
 *
 * Copyright (C) 2018 Osmo Salomaa
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick 2.0
import "platform"

IconButtonPL {
    id: attributionButton
    anchors.left: parent.left
    anchors.leftMargin: app.styler.themePaddingLarge
    anchors.top: navigationBlock.bottom
    anchors.topMargin: app.styler.themePaddingLarge
    height: icon.height
    icon.source: app.getIcon("icons/attribution/default")
    icon.sourceSize.height: app.styler.themeIconSizeSmall
    states: [
        State {
            when: !app.portrait && navigationBlockLandscapeLeftShield.height > 0
            AnchorChanges {
                target: attributionButton
                anchors.top: navigationBlockLandscapeLeftShield.bottom
            }
        }
    ]
    width: icon.width
    z: 500

    property string logo: ""

    onClicked: app.push(Qt.resolvedUrl("AttributionPage.qml"))
    onLogoChanged: attributionButton.icon.source = logo ?
        app.getIcon("icons/attribution/%1".arg(logo)) : "";

    Connections {
        target: app.styler
        onIconVariantChanged: attributionButton.icon.source = attributionButton.logo ?
                                  app.getIcon("icons/attribution/%1".arg(attributionButton.logo)) : "";
    }

}
