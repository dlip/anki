<!--
Copyright: Ankitects Pty Ltd and contributors
License: GNU AGPL, version 3 or later; http://www.gnu.org/licenses/agpl.html
-->
<script lang="ts">
    import ButtonGroup from "../components/ButtonGroup.svelte";
    import ButtonGroupItem from "../components/ButtonGroupItem.svelte";
    import CommandIconButton from "./CommandIconButton.svelte";

    import * as tr from "../lib/ftl";
    import {
        boldIcon,
        italicIcon,
        underlineIcon,
        superscriptIcon,
        subscriptIcon,
        eraserIcon,
    } from "./icons";

    export let api = {};
</script>

<ButtonGroup {api}>
    <ButtonGroupItem>
        <CommandIconButton
            key="bold"
            shortcut={"Control+B"}
            tooltip={tr.editingBoldText()}>{@html boldIcon}</CommandIconButton
        >
    </ButtonGroupItem>

    <ButtonGroupItem>
        <CommandIconButton
            key="italic"
            shortcut={"Control+I"}
            tooltip={tr.editingItalicText()}>{@html italicIcon}</CommandIconButton
        >
    </ButtonGroupItem>

    <ButtonGroupItem>
        <CommandIconButton
            key="underline"
            shortcut={"Control+U"}
            tooltip={tr.editingUnderlineText()}>{@html underlineIcon}</CommandIconButton
        >
    </ButtonGroupItem>

    <ButtonGroupItem>
        <CommandIconButton
            key="superscript"
            shortcut={"Control+="}
            tooltip={tr.editingSuperscript()}>{@html superscriptIcon}</CommandIconButton
        >
    </ButtonGroupItem>

    <ButtonGroupItem>
        <CommandIconButton
            key="subscript"
            shortcut={"Control+Shift+="}
            tooltip={tr.editingSubscript()}>{@html subscriptIcon}</CommandIconButton
        >
    </ButtonGroupItem>

    <ButtonGroupItem>
        <CommandIconButton
            key="removeFormat"
            shortcut={"Control+R"}
            tooltip={tr.editingRemoveFormatting()}
            withoutState>{@html eraserIcon}</CommandIconButton
        >
    </ButtonGroupItem>
</ButtonGroup>
