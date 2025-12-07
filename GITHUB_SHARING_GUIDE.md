# GitHub Sharing Guide for Rose Labs

## What We've Set Up

Your Virtual Lab repository is now ready to share with your Rose Labs team on GitHub. Here's what's been prepared:

### 1. Desktop App (NEW)
- **Location**: `desktop_app/`
- **What it is**: A macOS application that launches the Paper Enhancement Streamlit interface
- **Includes**:
  - `paper_enhancement.applescript` - Source code
  - `PaperEnhancement.icns` - Custom icon
  - `build_app.sh` - Automated build script
  - `README.md` - User instructions

### 2. Environment Template
- **File**: `.env.example`
- **Purpose**: Template for team members to create their own `.env` file
- **Safe to commit**: Contains no actual API keys, just placeholders

### 3. Documentation
- **FORK_SETUP.md**: Complete guide for forking to Rose-Labs organization
- **desktop_app/README.md**: Instructions for building and using the desktop app
- **This file**: Quick reference for sharing on GitHub

### 4. Security
- **Protected files** (will NOT be committed to GitHub):
  - `.env` - Your actual API keys
  - `venv/` - Python virtual environment
  - `paper_enhancement/temp/` - Temporary uploaded files
  - `paper_enhancement/output/` - Generated papers
  - `*.key`, `*secret*`, `*api_key*` - Any other sensitive files

## Quick Start: Share on GitHub

### Step 1: Fork to Rose-Labs (One Time)
Follow the detailed instructions in `FORK_SETUP.md`, but here's the summary:

1. Go to https://github.com/zou-group/virtual_lab
2. Click "Fork" → Select "Rose-Labs" organization
3. Create the fork

### Step 2: Update Your Local Repository
```bash
cd ~/virtual_lab

# Point to your Rose-Labs fork
git remote remove origin
git remote add origin https://github.com/Rose-Labs/zhao-virtual-lab.git

# Keep original repo as upstream
git remote add upstream https://github.com/zou-group/virtual_lab.git
```

### Step 3: Commit Your Changes
```bash
# Check status (make sure .env is NOT listed!)
git status

# Add all new files
git add desktop_app/ FORK_SETUP.md GITHUB_SHARING_GUIDE.md .env.example .gitignore

# Commit
git commit -m "Add desktop app and Rose Labs setup documentation"

# Push to Rose-Labs fork
git push -u origin main
```

### Step 4: Authenticate
You'll need to set up authentication. Choose one method:

**Option A: Personal Access Token**
1. GitHub → Settings → Developer settings → Personal access tokens → Tokens (classic)
2. Generate token with `repo` scope
3. Use token as password when prompted

**Option B: SSH Key**
```bash
ssh-keygen -t ed25519 -C "your_email@example.com"
cat ~/.ssh/id_ed25519.pub
# Copy output to GitHub → Settings → SSH and GPG keys
git remote set-url origin git@github.com:Rose-Labs/zhao-virtual-lab.git
```

## For Your Team Members

Share this with colleagues who want to use the repository:

### Setup Instructions for Team

1. **Clone the repository:**
   ```bash
   git clone https://github.com/Rose-Labs/zhao-virtual-lab.git
   cd zhao-virtual-lab
   ```

2. **Create environment file:**
   ```bash
   cp .env.example .env
   # Edit .env and add your actual API keys
   nano .env
   ```

3. **Follow the main setup:**
   - Follow instructions in the main README for installing Python dependencies
   - Set up the virtual environment
   - Install required packages

4. **Build the desktop app (macOS only):**
   ```bash
   cd desktop_app
   ./build_app.sh
   ```

5. **Launch the app:**
   - Double-click "Paper Enhancement.app" on your Desktop
   - Or run manually: `streamlit run paper_enhancement/streamlit_app.py`

## What Your Team Can Do

With access to the Rose-Labs repository, team members can:
- Use the desktop app to easily launch the paper enhancement tool
- Run the Streamlit interface to evaluate and enhance student papers
- Contribute improvements back to the shared repository
- Stay updated with team customizations
- Maintain separation from the original zou-group repository

## What Gets Shared vs. What Stays Private

### ✅ Shared on GitHub (Public to Rose-Labs members):
- Source code (Python, AppleScript)
- Documentation and guides
- Build scripts
- Configuration templates (.env.example)
- Icon files and assets

### ❌ Stays Private (In .gitignore, never committed):
- API keys (.env)
- Virtual environment (venv/)
- Generated outputs (paper_enhancement/output/)
- Temporary files (paper_enhancement/temp/)
- Personal data and credentials

## Maintaining Your Fork

### Getting Updates from Original Repository
Periodically sync with zou-group/virtual_lab:

```bash
git fetch upstream
git checkout main
git merge upstream/main
git push origin main
```

### Sharing Team Updates
When team members make improvements:

```bash
git add .
git commit -m "Description of changes"
git push origin main
```

### Branching for Experiments
For major changes:

```bash
git checkout -b feature-name
# Make changes
git commit -m "Description"
git push origin feature-name
# Create pull request on GitHub
```

## Common Workflows

### Adding a New Team Member
1. Add them to Rose-Labs organization on GitHub
2. Share: Repository URL, setup instructions, and `.env` contents (securely!)
3. They clone, create `.env`, and build the desktop app

### Making Changes
1. `git pull origin main` (get latest)
2. Make changes
3. Test locally
4. `git add` and `git commit`
5. `git push origin main`

### Fixing Conflicts
```bash
git fetch origin
git merge origin/main
# Resolve conflicts in files
git add .
git commit -m "Merge conflicts resolved"
git push origin main
```

## Repository Structure

```
zhao-virtual-lab/
├── desktop_app/              # macOS desktop application
│   ├── paper_enhancement.applescript
│   ├── PaperEnhancement.icns
│   ├── build_app.sh
│   └── README.md
├── paper_enhancement/        # Main pipeline code
│   ├── streamlit_app.py
│   ├── pipeline.py
│   └── ...
├── .env.example              # API key template (SAFE to commit)
├── .env                      # Your actual keys (NEVER committed)
├── .gitignore                # Protects sensitive files
├── FORK_SETUP.md             # Detailed fork instructions
├── GITHUB_SHARING_GUIDE.md   # This file
└── README.md                 # Main project documentation
```

## Security Checklist

Before pushing to GitHub:
- [ ] Verify `.env` is in `.gitignore`
- [ ] Check `git status` doesn't show `.env`
- [ ] Ensure no API keys in any committed files
- [ ] Created `.env.example` with placeholders only
- [ ] Tested that temp/ and output/ directories are ignored

## Need Help?

- **Fork setup issues**: See `FORK_SETUP.md`
- **Desktop app problems**: See `desktop_app/README.md`
- **General questions**: Check the main `README.md`
- **Git questions**: https://docs.github.com/en/get-started

## Next Steps

1. ✅ Fork created at Rose-Labs/zhao-virtual-lab
2. ✅ Local repository remotes updated
3. ✅ Changes committed and pushed
4. ⏭️ Share repository URL (https://github.com/Rose-Labs/zhao-virtual-lab) with team
5. ⏭️ Securely share .env contents with team (not via GitHub!)

You're all set! Your team can now collaborate on the Paper Enhancement Pipeline.
