<!--
Copyright: Ankitects Pty Ltd and contributors
License: GNU AGPL, version 3 or later; http://www.gnu.org/licenses/agpl.html
-->
<script lang="ts">
    import IconConstrain from "./IconConstrain.svelte";
    import type { DropdownProps } from "./dropdown";
    import { dropdownKey } from "./context-keys";
    import { onMount, createEventDispatcher, getContext } from "svelte";

    let className = "";
    export { className as class };
    export let tooltip: string | undefined = undefined;

    export let iconSize = 100;
    export let widthMultiplier = 1;
    export let flipX = false;

    const dispatch = createEventDispatcher();

    let spanRef: HTMLSpanElement;

    const dropdownProps = getContext<DropdownProps>(dropdownKey) ?? { dropdown: false };

    onMount(() => {
        dispatch("mount", { span: spanRef });
    });
</script>

<span
    bind:this={spanRef}
    title={tooltip}
    class="badge {className}"
    class:dropdown-toggle={dropdownProps.dropdown}
    {...dropdownProps}
    on:click
    on:mouseenter
    on:mouseleave
>
    <IconConstrain {iconSize} {widthMultiplier} {flipX}>
        <slot />
    </IconConstrain>
</span>

<style>
    .badge {
        color: var(--badge-color, inherit);
    }

    .dropdown-toggle::after {
        display: none;
    }
</style>
