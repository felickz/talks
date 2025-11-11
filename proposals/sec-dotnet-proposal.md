> [!WARNING]
> **DRAFT** - This proposal is a work in progress and subject to change.

# "Security-First .NET: How GitHub's Tools Protect Your Open-Source Projects Without Slowing You Down"


## Abstract

As .NET developers, we often focus on features and functionality while security becomes an afterthought. GitHub offers a powerful suite of free security tools that open source .NET developers can leverage immediately to protect their applications. This session goes beyond theory to show you practical, hands-on techniques for integrating Dependency Graph/Review, Dependabot alerts, CodeQL, and Secret Scanning into your everyday .NET workflow.  With GitHub Copilot's AI-powered capabilities, you'll discover how to fix security vulnerabilities faster using contextual remediation suggestions.  You'll learn how community-driven security practices can help identify vulnerabilities before they reach production, how to effectively manage dependencies with the latest NuGet improvements, and how to leverage the collective knowledge of the .NET ecosystem to build more secure applications. Whether you're building a small open source library or a complex application with Blazor, MAUI, or ASP.NET Core, you'll walk away with actionable security practices you can implement in your projects today—because secure code is quality code, and the open source community deserves both.


## Description

We will explore a GitHub Sample app: https://github.com/dotnet-felickz/monorepo to demonstrate the application of these security features in a real-world-ish .NET projects using Maui and Blazor/MVC with ASP.NET Core.

## Key Topics

- GitHub Tools for the .NET Ecosystem to help secure ( Dependency Graph, Dependabot, CodeQL, Secret Scanning, GitHub Actions)

- General Security
  - GitHub Actions for CI/CD Security
    - GitHub Actions Security
  - Global Private Registry for NuGet Authentication across Code Scanning and Dependency Scanning features
  - Leveraging Copilot Chat and the GitHub MCP server for security-focused code explanations and recommendations

- Techniques for scanning for vulnerabilities (SCA, SAST, Secrets)
  - Code (legacy, microservices, monorepos)
  - Dependencies (direct and transitive)
  - Secrets (prevention and detection)



### SCA
  - Dependency Graph + submissions for transitive depenencies in .NET via [Component Detection Submission Action](https://github.com/marketplace/actions/component-detection-dependency-submission-action)
  - [GitHub Advisory Database curation of NuGet vulnerabilities](https://github.com/advisories?query=type%3Areviewed+ecosystem%3Anuget) to generate Dependabot Alerts
  - [Customize your dependency review configuration](https://resources.github.com/learn/pathways/security/intermediate/customize-dependency-review-configuration/)
  - Dependabot Security and Version Updates
  - Immutable releases for binaries + signed with SBOM
  - Copilot AI for App Modernization

- Related News
  - [NuGetAudit 2.0: Elevating Security and Trust in Package Management](https://devblogs.microsoft.com/dotnet/nugetaudit-2-0-elevating-security-and-trust-in-package-management/)
  - [Dependabot can now perform version updates for the .NET SDK](https://github.blog/changelog/2024-11-19-dependabot-can-now-perform-version-updates-for-the-net-sdk/)
  - [The new Dependabot NuGet updater: 65% faster with native .NET](https://devblogs.microsoft.com/dotnet/the-new-dependabot-nuget-updater/)
  - [Agent mode in Visual Studio makes .NET upgrades easier than ever](https://dotnet.microsoft.com/en-us/platform/upgrade)


### Secret Protection

- Push Protection
- [Keeping secrets out of public repositories](https://github.blog/news-insights/product-news/keeping-secrets-out-of-public-repositories/)
- [Detection of common NuGet / Azure / Cloud / API  tokens and secrets](https://docs.github.com/en/code-security/secret-scanning/introduction/supported-secret-scanning-patterns#high-confidence-patterns)

### Code Scanning
  - CodeQL Default Setup to scan Branch / PR
  - Advanced Setup yaml for fine-grained control (.NET monorepo sample [codeql.yml](https://github.com/dotnet-felickz/monorepo/blob/main/.github/workflows/codeql.yml))
  - CodeQL coverage for Csharp and GitHub Actions languages, frameworks and queries
  - CodeQL CLI / VSCode Extension
    -  Custom queries + Multi repo variant analysis for query testing / hunting at scale
  - Copilot Autofix - Using AI to suggest and apply code fixes automatically


- Related News
  - [CodeQL code scanning can analyze Java and C# codebases without needing a build](https://github.blog/changelog/2024-08-28-codeql-code-scanning-can-analyze-java-and-c-codebases-without-needing-a-build-ga/)
  - [CodeQL - Full support for C# 13 / .NET 9](https://codeql.github.com/docs/codeql-overview/codeql-changelog/codeql-cli-2.20.5/#c)  

## Main Demos

- Automatic Dependency Submission / Blocking PR with SCA vuln using Dependency Review / PR with CodeQL SAST alert
- Secret Protection - Push Protection
- PR with CodeQL SAST alert / Copilot Autofix for vulnerabilities
- MCP #get_code_scanning_alert and Agent Mode for complex fix - See: [GitHub MCP Setup for Advanced Security](https://github.com/felickz/talks/blob/main/proposals/sec-dotnet-proposal.md)
