<!--
Copyright: Ankitects Pty Ltd and contributors
License: GNU AGPL, version 3 or later; http://www.gnu.org/licenses/agpl.html
-->
<script lang="ts">
    export let id: string | undefined = undefined;
    let className: string = "";
    export { className as class };
</script>

<header {id} class="sticky-header container-fluid {className}">
    <slot />
</header>

<style lang="scss">
    .sticky-header {
        position: sticky;
        left: 0;
        right: 0;
        z-index: 10;

        background: var(--window-bg);
        border-style: solid;
        border-color: var(--medium-border);
        border-width: 0;
        padding: 0 3px;

        top: 0;
        border-bottom-width: 1px;
    }
</style>
