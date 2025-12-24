# Phase 1: Basic Checkout
# Goal: Checkout source code from GitHub

name: Phase 1 - Basic Checkout

on:
  # Temporarily disabled - enable manually via workflow_dispatch
  push:
    branches: [ main, phase1 ]
  pull_request:
    branches: [ main ]
  workflow_dispatch:

jobs:
  checkout:
    name: Checkout Code
    runs-on: ubuntu-latest
    
    steps:
      - name: 📦 Checkout source code
        uses: actions/checkout@v4
        
      - name: ✅ Checkout completed
        run: |
          echo "✅ Source code checked out successfully!"
          echo "Repository: ${{ github.repository }}"
          echo "Branch: ${{ github.ref_name }}"
          echo "Commit SHA: ${{ github.sha }}"
          echo "Triggered by: ${{ github.actor }}"
          
      - name: 📋 List workspace contents
        run: |
          echo "Workspace contents:"
          ls -la
