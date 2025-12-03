# Setting Up Rose Labs Fork of Virtual Lab

This document explains how to properly fork and maintain the Virtual Lab repository for your lab.

## Why Fork?

You're currently using the original `zou-group/virtual_lab` repository. Forking to your lab's GitHub organization allows you to:
- Share your custom modifications (like the Paper Enhancement app) with your team
- Track your changes separately from the upstream repository
- Pull in updates from the original repository when needed
- Maintain your own version with lab-specific configurations

## Step 1: Fork on GitHub

1. Go to https://github.com/zou-group/virtual_lab
2. Click the "Fork" button (top right)
3. Select "Rose-Labs" as the destination organization
4. Keep the repository name as `virtual_lab` (or customize if desired)
5. Ensure "Copy the main branch only" is unchecked if you want all branches
6. Click "Create fork"

## Step 2: Update Your Local Repository

Once the fork is created on GitHub, update your local repository to point to it:

```bash
cd ~/virtual_lab

# Add the Rose-Labs fork as the new origin
git remote remove origin
git remote add origin https://github.com/Rose-Labs/virtual_lab.git

# Add the original repository as upstream (for pulling updates)
git remote add upstream https://github.com/zou-group/virtual_lab.git

# Verify remotes
git remote -v
# Should show:
# origin    https://github.com/Rose-Labs/virtual_lab.git (fetch)
# origin    https://github.com/Rose-Labs/virtual_lab.git (push)
# upstream  https://github.com/zou-group/virtual_lab.git (fetch)
# upstream  https://github.com/zou-group/virtual_lab.git (push)
```

## Step 3: Push Your Current Work

```bash
# Check what branch you're on
git branch

# If you have uncommitted changes, commit them first
git status
git add .
git commit -m "Add Paper Enhancement desktop app and lab customizations"

# Push to your fork (you may need to authenticate)
git push -u origin main
```

## Step 4: Set Up Authentication

You'll likely need to authenticate with GitHub. Choose one:

### Option A: Personal Access Token (Recommended)
1. Go to GitHub → Settings → Developer settings → Personal access tokens → Tokens (classic)
2. Generate new token with `repo` scope
3. When git asks for password, use the token instead

### Option B: SSH Key
```bash
# Generate SSH key if you don't have one
ssh-keygen -t ed25519 -C "your_email@stanford.edu"

# Add to GitHub: Settings → SSH and GPG keys → New SSH key
cat ~/.ssh/id_ed25519.pub

# Update remote to use SSH
git remote set-url origin git@github.com:Rose-Labs/virtual_lab.git
```

## Step 5: Collaborate with Your Lab

Now your team members can:

```bash
# Clone the Rose Labs fork
git clone https://github.com/Rose-Labs/virtual_lab.git
cd virtual_lab

# Set up upstream to pull updates from original repository
git remote add upstream https://github.com/zou-group/virtual_lab.git

# Follow the setup instructions in the main README
```

## Keeping Your Fork Updated

Periodically sync with the upstream repository to get updates:

```bash
# Fetch upstream changes
git fetch upstream

# Merge upstream changes into your main branch
git checkout main
git merge upstream/main

# Push updates to your fork
git push origin main
```

## Recommended .gitignore Additions

Add these to your `.gitignore` to avoid committing sensitive data:

```
# Environment and secrets
.env
*.env

# Virtual environment
venv/
.venv/

# Temporary files
paper_enhancement/temp/
*.pyc
__pycache__/

# macOS
.DS_Store
```

## Repository Structure

After setting this up, your repository structure will be:
```
Rose-Labs/virtual_lab (your fork)
  ├── desktop_app/           # Your lab's additions
  ├── paper_enhancement/     # Core pipeline
  ├── .env.example           # Template for API keys (no secrets)
  └── ...                    # Other files from upstream
```

## Best Practices

1. **Never commit secrets**: Keep `.env` in `.gitignore`, provide `.env.example` as a template
2. **Document custom changes**: Add README files for your additions (like `desktop_app/README.md`)
3. **Use branches**: Create feature branches for major changes
4. **Pull before push**: Always `git pull` before pushing to avoid conflicts
5. **Keep upstream sync**: Regularly fetch from `zou-group/virtual_lab` to get improvements

## Sharing with Collaborators

When sharing with lab members:
1. Add them to the Rose-Labs organization with appropriate permissions
2. They should clone from `https://github.com/Rose-Labs/virtual_lab`
3. Share the `.env` file contents securely (not via GitHub!)
4. Point them to this setup guide

## Questions?

This setup allows your lab to:
- ✅ Maintain your customizations (desktop app, configs)
- ✅ Share easily with team members
- ✅ Get updates from the original repository
- ✅ Keep sensitive data private
