<!--
Copyright: Ankitects Pty Ltd and contributors
License: GNU AGPL, version 3 or later; http://www.gnu.org/licenses/agpl.html
-->
<script lang="ts">
    import Badge from "../components/Badge.svelte";
    import { onMount } from "svelte";
    import { stickyOn, stickyOff } from "./icons";
    import { getEditorField } from "./EditorField.svelte";
    import * as tr from "../lib/ftl";
    import { bridgeCommand } from "../lib/bridgecommand";
    import { registerShortcut, getPlatformString } from "../lib/shortcuts";

    export let active: boolean;

    $: icon = active ? stickyOn : stickyOff;

    const editorField = getEditorField();
    const keyCombination = "F9";

    export let index: number;

    function toggle() {
        bridgeCommand(`toggleSticky:${index}`, (value: boolean) => {
            active = value;
        });
    }

    function shortcut(element: HTMLElement): void {
        registerShortcut(toggle, keyCombination, element);
    }

    onMount(() => editorField.element.then(shortcut));
</script>

<span class:highlighted={active} on:click|stopPropagation={toggle}>
    <Badge
        tooltip="{tr.editingToggleSticky()} ({getPlatformString(keyCombination)})"
        widthMultiplier={0.7}>{@html icon}</Badge
    >
</span>

<style lang="scss">
    span {
        opacity: 0.4;

        &.highlighted {
            opacity: 1;
        }
        &:hover {
            opacity: 0.8;
        }
    }
</style>
