#!/bin/env bash

alias wtest="yarn test --watch"
alias c="bin/rails c"

ssb() {
    STORYBOOK_FOCUS=app/components/ProfileAssessment/**/*.stories.@(mdx|tsx)
    yarn storybook
}
