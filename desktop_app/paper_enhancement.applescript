tell application "Terminal"
	activate
	do script "cd ~/virtual_lab && source venv/bin/activate && set -a && source .env && set +a && streamlit run paper_enhancement/streamlit_app.py"
end tell

