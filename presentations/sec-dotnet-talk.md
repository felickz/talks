---
marp: true
theme: default
style: |
  section {
    background-color: #0d1117;
    color: #c9d1d9;
  }
  h1, h2, h3, h4, h5, h6 {
    color: #f0f6fc;
  }
  a {
    color: #58a6ff;
  }
  code {
    background-color: #161b22;
  }
  footer {
    position: absolute;
    bottom: 10px;
    right: 10px;
    color: #8b949e;
    font-size: 0.6em;
  }
  .draft-banner {
    background-color: #f85149;
    color: white;
    font-weight: bold;
    padding: 8px 16px;
    position: absolute;
    top: 20px;
    right: 20px;
    border-radius: 4px;
    transform: rotate(10deg);
    box-shadow: 0px 2px 6px rgba(0,0,0,0.3);
    z-index: 100;
  }
  .profile-container {
    position: absolute;
    bottom: 20px;
    left: 20px;
    display: flex;
    align-items: center;
    z-index: 100;
  }
  .profile-image {
    width: 80px;
    height: 80px;
    border-radius: 50%;
    margin-right: 15px;
  }
  .profile-info {
    display: flex;
    flex-direction: column;
  }
  .profile-name {
    color: #f0f6fc;
    font-size: 1.5em;
    font-weight: bold;
    margin: 0;
  }
  .profile-handle {
    color: #8b949e;
    font-size: 1.1em;
    margin: 0;
  }
---

<!-- _footer: '' -->

![bg left:40% 80%](./logos/GitHub_Lockup_Light.png)

<div class="draft-banner">DRAFT</div>

# **Security-First .NET**

### How GitHub's Tools Protect Your Open-Source Projects Without Slowing You Down

<div class="profile-container">
  <img src="https://avatars.githubusercontent.com/u/1760475" alt="Chad Bentz" class="profile-image">
  <div class="profile-info">
    <p class="profile-name">Chad Bentz</p>
    <p class="profile-handle">@felickz / GitHub</p>
  </div>
</div>

---

<!-- _footer: '@felickz' -->

# About Me

![bg right:30% 80%](./logos/GitHub_Invertocat_Light.png)

- GitHub
- .NET Developer
- Security Advocate
- Open Source Contributor

---

<!-- _footer: '@felickz' -->

# Why Security Matters for .NET

- Security is often an afterthought
- Open source vulnerabilities are increasing
- Growing attack surface in modern .NET apps
- NuGet ecosystem brings both power and risk
- Build security into your workflow, not on top

---

<!-- _footer: '@felickz' -->

# Agenda

![bg right:30%](./logos/GitHub_Invertocat_Light.png)

1. **GitHub Security Tools for .NET**
2. **Code Scanning with CodeQL**
3. **Dependency Management & SCA**
4. **Secret Protection**
5. **Copilot for Security**
6. **Demos**

---

<!-- _footer: '@felickz' -->

# Real-World Example

Throughout this talk, we'll reference:

```
https://github.com/dotnet-felickz/monorepo
```

- Contains .NET projects using:
  - MAUI
  - Blazor/MVC with ASP.NET Core
  - Shared libraries
  - GitHub Actions workflows

---

<!-- _footer: '@felickz' -->

# GitHub's Security Toolbox

![bg right:40% 80%](./logos/GitHub_Invertocat_Light.png)

- **Dependency Graph/Review**
- **Dependabot Alerts & Updates**
- **CodeQL**
- **Secret Scanning**
- **GitHub Actions Security**
- **Copilot Security Assistance**

All **FREE** for open source projects!

---

<!-- _footer: '@felickz' -->

# Code Scanning with CodeQL

## What is it?
- Static Application Security Testing (SAST)
- Queries your code as data
- Finds security vulnerabilities
- Integrates with PR workflow

## Key Benefits
- No false positives philosophy
- Deep understanding of .NET frameworks
- Fully supports C# 13 / .NET 9
- Can analyze without building (NEW!)

---

<!-- _footer: '@felickz' -->

# CodeQL Setup Options

## Default Setup (Recommended)
```yaml
# Simple setup in just a few clicks
name: "CodeQL"

on:
  push:
    branches: [ "main" ]
  pull_request:
    branches: [ "main" ]
  schedule:
    - cron: '17 0 * * 0'

jobs:
  analyze:
    name: Analyze
    runs-on: ubuntu-latest
    permissions:
      security-events: write
    steps:
      - uses: actions/checkout@v4
      - uses: github/codeql-action/init@v3
      - uses: github/codeql-action/analyze@v3
```

---

<!-- _footer: '@felickz' -->

# Advanced CodeQL for .NET Monorepo

```yaml
# From our monorepo sample
steps:
  # ...setup steps...
  - name: Initialize CodeQL
    uses: github/codeql-action/init@v3
    with:
      languages: csharp
      queries: security-extended,security-and-quality

  - name: Autobuild
    uses: github/codeql-action/autobuild@v3

  # Or use custom build commands:
  # - run: |
  #     dotnet restore ./src/MyApp.sln
  #     dotnet build ./src/MyApp.sln --configuration Release
```

---

<!-- _footer: '@felickz' -->

# CodeQL Tools for .NET Developers

![bg right:40% 90%](./logos/GitHub_Invertocat_Light.png)

- **VSCode Extension**
  - Write & test custom queries
  - Explore code databases

- **CodeQL CLI**
  - Multi-repo variant analysis
  - Vulnerability hunting at scale

- **Query Libraries**
  - Standard & extended security
  - .NET framework-specific queries

---

<!-- _footer: '@felickz' -->

# What CodeQL Finds in .NET

- SQL Injection
- CSRF vulnerabilities
- XSS in Razor views
- Insecure deserialization
- Hard-coded credentials
- Improper authentication
- Weak crypto implementations
- Potential DoS vectors
- And many more...

---

<!-- _footer: '@felickz' -->

# Software Composition Analysis (SCA)

![bg right:40% 80%](./logos/GitHub_Invertocat_Light.png)

## Dependency Graph & Review
- Maps all NuGet packages
- Direct & transitive dependencies
- Review changes in PRs
- Integration with .NET SDK

## Component Detection
```yaml
- name: Component Detection
  uses: microsoft/component-detection-dependency-submission-action@v1.1.0
  with:
    detection-level: Direct
```

---

<!-- _footer: '@felickz' -->

# Dependabot: Automated Security

## Security Updates
- Automatic PR for vulnerabilities
- Contextual security info
- Customizable via dependabot.yml

## Version Updates
- Keep dependencies fresh
- .NET SDK updates (NEW!)
- 65% faster with native .NET

```yaml
version: 2
updates:
  - package-ecosystem: "nuget"
    directory: "/"
    schedule:
      interval: "weekly"
```

---

<!-- _footer: '@felickz' -->

# Secret Protection

![bg right:40% 80%](./logos/GitHub_Invertocat_Light.png)

## Push Protection
- Prevents secrets from being committed
- Scans commits in real-time
- Blocks pushes with secrets

## Secret Scanning
- Detects leaked secrets
- NuGet API keys
- Azure connection strings
- AWS & other cloud credentials
- Custom patterns

---

<!-- _footer: '@felickz' -->

# Latest .NET Security Features

## NuGetAudit 2.0
- Enhanced security validation
- Trust and integrity checks
- Package signing verification

## Immutable Releases
- Signed binaries with SBOM
- Software Bill of Materials
- Supply chain transparency

## Agent Mode in Visual Studio
- AI-powered .NET upgrades
- Identifies security risks

---

<!-- _footer: '@felickz' -->

# Copilot for Security

![bg right:40% 80%](./logos/GitHub_Invertocat_Light.png)

## Copilot Autofix
- Automatically suggests fixes
- Contextual understanding of code
- One-click remediation

## Copilot Chat
- Security-focused explanations
- "What does this code do?"
- "Is this code secure?"
- Remediation recommendations

---

<!-- _footer: '@felickz' -->

# MCP for Security Analysis

```
#get_code_scanning_alert
```

- Get vulnerability details
- Understand impact and context
- Security-aware code generation
- Explanation of complex issues

---

<!-- _footer: '@felickz' -->

# Demo Time!

## What We'll See
1. Blocking PR with SCA vulnerability using Dependency Review
2. CodeQL alert in a PR with push protection
3. AI Autofix for simple vulnerabilities
4. MCP for complex security fixes

---

<!-- _footer: '@felickz' -->

# Key Takeaways

![bg right:40% 80%](./logos/GitHub_Invertocat_Light.png)

1. Security tools are **free** for open source
2. Integrate security early in development
3. Leverage AI for faster remediation
4. Stay updated with .NET security news
5. Community-driven security benefits everyone

---

<!-- _footer: '@felickz' -->

# Resources

- 📋 Slides: [github.com/felickz/talks](https://github.com/felickz/talks)
- 🌐 Demo repo: [github.com/dotnet-felickz/monorepo](https://github.com/dotnet-felickz/monorepo)
- 📚 CodeQL docs: [codeql.github.com](https://codeql.github.com)
- 🔍 Advisory DB: [github.com/advisories](https://github.com/advisories?query=ecosystem%3Anuget)
- 🛡️ Security Lab: [securitylab.github.com](https://securitylab.github.com)

---

<!-- _footer: '@felickz' -->

# Thank You!

![bg right:30%](./logos/GitHub_Invertocat_Light.png)

## Questions?

- GitHub: @felickz
- Demo: github.com/dotnet-felickz/monorepo

### "Secure code is quality code, and the open source community deserves both."