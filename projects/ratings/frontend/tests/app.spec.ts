import { describe, it, expect } from 'vitest'
import { renderSuspended } from '@nuxt/test-utils/runtime'
import App from '../app/app.vue'

describe('App', () => {
  it('renders the app', async () => {
    const { html } = await renderSuspended(App)
    expect(html()).toContain('<h2>Welcome</h2>')
  })
})
