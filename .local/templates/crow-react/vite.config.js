// :^)

import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'

export default defineConfig({
  base: '/static/',
  build: {
    outDir: 'build/static',
    emptyOutDir: true,
  },
  plugins: [react()],
})
