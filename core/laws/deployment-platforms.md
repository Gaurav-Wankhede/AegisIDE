---
trigger: glob
globs: *.yml,*.yaml,*.json,vercel,netlify,cloudflare,aws,gcp,azure,shuttle,upstash
---

# Universal Deployment Platform Rules for Modern IDEs

## Core Architecture Principles

### Extreme Microservices Decomposition (EMD)
- **Maximum 80 lines per file** including comments, imports, and whitespace
- **Always create deep nested subfolders**: `deploy/platforms/vercel/frontend/config.json` (≤80 lines)
- **Smallest possible files** - decompose at platform, environment, and service levels
- When approaching 80 lines, immediately extract functionality into new subfolders
- Use **modular deployment architecture** with clear separation of concerns

### Free Tier First Approach (FTFA)
- **Always prioritize free tier** and always-free options in deployment strategies
- **Cost optimization** as primary consideration in platform selection
- **Gradual scaling** from free to paid tiers based on actual usage
- **Multi-platform strategy** to maximize free tier benefits
- **Resource monitoring** to stay within free tier limits

## Modern Deployment Platforms (2025)

### Frontend-First Platforms
- **Vercel**: 100GB bandwidth free, unlimited personal projects, edge functions
- **Netlify**: 100GB bandwidth, 300 build minutes, form handling, functions
- **Cloudflare**: Always free CDN, Workers, Pages, R2 storage, Zero Trust
- **Railway**: $5 monthly credit, automatic scaling, PostgreSQL provisioning
- **Shuttle**: Generous Rust application limits, rapid deployment
- **GitHub Pages**: Free static hosting, Jekyll integration
- **Surge.sh**: Simple static site deployment with custom domains

## Cloud Provider Free Tiers

### Cloud Provider Free Tiers
- **AWS**: Lambda (1M requests), DynamoDB (25GB), S3 (5GB), EC2 t2.micro (12 months)
- **GCP**: e2-micro instance, Cloud Functions, Firestore, $300 credit (90 days)
- **Azure**: Functions (1M executions), Cosmos DB (5GB), VMs (12 months)
- **Oracle**: Most generous - 2 AMD + 4 ARM instances, 200GB storage (permanent)
- **DigitalOcean**: $200 credit for 60 days, droplets from $4/month
- **Linode**: $100 credit, compute instances from $5/month

## Specialized Platforms

### Specialized Services
- **Upstash**: Serverless Redis (10K requests/day), Kafka (10K messages/day), QStash
- **Supabase**: PostgreSQL (500MB), auth, storage (1GB), edge functions
- **PlanetScale**: MySQL with database branching, 5GB free
- **Leapcell**: Full-stack deployment, Git integration, custom domains
- **Render**: Web services, databases, static sites with free tier
- **Fly.io**: Global deployment, free allowances for small apps

## Cost Optimization Strategies

### Cost Optimization Strategies
- **Multi-platform deployment** to distribute load across free tiers
- **Resource monitoring** to track usage against limits
- **Serverless-first architecture** to minimize always-on costs
- **CDN utilization** to reduce bandwidth costs
- Start with **generous free tiers** (Oracle, Railway, Vercel)
- **Scale up selectively** only when free tier limits reached
- Use **static site generation** to minimize compute costs
- Implement **edge caching** to reduce origin server load
- Create **function-based APIs** instead of always-on servers

## Platform-Specific Deployment Patterns

### Deployment Patterns
- **Static Sites**: Vercel (Next.js), Netlify (JAMstack), Cloudflare Pages, GitHub Pages
- **Full-Stack**: Railway (Node.js/Python/Rust), Render, Fly.io, Heroku
- **Serverless**: Vercel Functions, Netlify Functions, Cloudflare Workers, AWS Lambda
- **Containers**: DigitalOcean App Platform, Azure Container Instances, Google Cloud Run

## Database and Storage Solutions

### Database and Storage
- **Databases**: Supabase (500MB PostgreSQL), PlanetScale (5GB MySQL), MongoDB Atlas (512MB)
- **Redis**: Upstash (10K requests/day), Railway Redis included
- **Storage**: Cloudflare R2 (10GB, no egress), AWS S3 (5GB), Supabase (1GB)
- **CDN**: Cloudflare (unlimited), AWS CloudFront, Azure CDN

## CI/CD and Automation

### CI/CD Integration
- **GitHub Actions**: 2000 minutes/month free, deployment workflows, secrets management
- **Platform Native**: Vercel/Netlify/Cloudflare automatic Git deployments
- **Multi-Platform**: Deployment scripts, environment variables, health checks
- **Advanced**: Matrix builds, dependency caching, rollback procedures

## Monitoring and Observability

### Monitoring and Performance
- **Analytics**: Vercel Analytics, Netlify Analytics, Cloudflare Analytics, Google Analytics
- **Error Tracking**: Sentry (generous free tier), LogRocket, Bugsnag, Rollbar
- **Uptime**: Uptime Robot (free), Pingdom, StatusCake
- **Performance**: Google PageSpeed Insights, GTmetrix, WebPageTest, Lighthouse CI
- **APM**: Railway Metrics, New Relic (free tier), DataDog (free tier)

## Security Best Practices

### Security Best Practices
- **SSL/TLS**: Let's Encrypt (free), Cloudflare SSL, platform-provided HTTPS
- **Environment Security**: Environment variables, secrets management, separate environments
- **Access Control**: Git-based permissions, team management, 2FA, audit logging
- **Rate Limiting**: API endpoint protection, DDoS mitigation
- **IP Allowlisting**: Where supported by platform

## Platform Selection Guide

### Platform Selection Guide
- **Vercel**: Next.js/React/Vue/Svelte, edge functions, preview deployments, generous free tier
- **Netlify**: JAMstack, static sites, forms, identity, CMS, branch deployments
- **Cloudflare**: Global edge, DDoS protection, Workers, always free CDN, R2 storage
- **Railway/Shuttle**: Full-stack with databases, Rust specialization, simple Git deployment
- **Oracle Cloud**: Most generous free tier (permanent), ARM instances, enterprise-grade
- **AWS**: Comprehensive services, 12-month free tier, Lambda/S3/DynamoDB always free
- **Supabase**: PostgreSQL alternative to Firebase, real-time, auth, storage

## Tech Stack Requirements

### Tech Stack Requirements
- **CLIs**: Vercel CLI, Netlify CLI, Cloudflare Wrangler, Railway CLI, AWS CLI
- **CI/CD**: GitHub Actions, GitLab CI, Azure DevOps, CircleCI
- **Monitoring**: Sentry, Uptime Robot, Google Analytics, Plausible, Mixpanel
- **Database**: Supabase, PlanetScale, Upstash, MongoDB Atlas, Railway PostgreSQL
- **Storage**: Cloudflare R2, AWS S3, Supabase Storage, Vercel Blob

## IDE Integration Guidelines

### Universal IDE Compatibility
- **VS Code** with platform-specific extensions
- **WebStorm** - comprehensive web development
- **Cursor** - AI-powered development environment
- **GitHub Codespaces** - cloud development environment

### Development Workflow
- Use **platform CLIs** for local development parity
- Implement **environment synchronization** between local and deployed
- Use **hot reload** and **live preview** features
- Set up **automated deployment** on code changes
- Use **platform dashboards** for deployment monitoring
