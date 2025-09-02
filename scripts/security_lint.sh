#!/bin/bash

# Security linting script for Xcode project files
# Detects malicious shell script phases in .pbxproj files

set -e

echo "🔍 Scanning for malicious shell scripts in Xcode project files..."

# Patterns to detect malicious content
MALICIOUS_PATTERNS=(
    "xxd -p -r"
    "echo.*[0-9a-f]\{20,\}"
    "curl.*sh"
    "wget.*sh"
    "base64.*sh"
    "eval.*curl"
    "eval.*wget"
)

# Files to scan
PROJECT_FILES=(
    "example/ios/Runner.xcodeproj/project.pbxproj"
    "example/macos/Runner.xcodeproj/project.pbxproj"
)

FOUND_MALICIOUS=false

for file in "${PROJECT_FILES[@]}"; do
    if [[ -f "$file" ]]; then
        echo "📁 Scanning $file..."

        # Check for PBXShellScriptBuildPhase sections
        if grep -q "PBXShellScriptBuildPhase" "$file"; then
            echo "⚠️  Found shell script phases in $file"

            # Extract shell script content
            shell_scripts=$(grep -A 20 "shellScript = " "$file" | grep -E "(xxd|curl|wget|base64|eval)" || true)

            if [[ -n "$shell_scripts" ]]; then
                echo "🚨 POTENTIAL MALICIOUS CONTENT FOUND in $file:"
                echo "$shell_scripts"
                FOUND_MALICIOUS=true
            else
                echo "✅ No malicious patterns found in $file"
            fi
        else
            echo "✅ No shell script phases found in $file"
        fi
    else
        echo "⚠️  File not found: $file"
    fi
done

# Check for ENABLE_USER_SCRIPT_SANDBOXING setting
echo ""
echo "🔒 Checking script sandboxing settings..."

for file in "${PROJECT_FILES[@]}"; do
    if [[ -f "$file" ]]; then
        sandbox_settings=$(grep "ENABLE_USER_SCRIPT_SANDBOXING" "$file" || true)
        if [[ -n "$sandbox_settings" ]]; then
            echo "📋 Script sandboxing settings in $file:"
            echo "$sandbox_settings"

            # Check if any are set to NO
            if echo "$sandbox_settings" | grep -q "= NO"; then
                echo "⚠️  WARNING: Some configurations have script sandboxing disabled"
            else
                echo "✅ All configurations have script sandboxing enabled"
            fi
        else
            echo "⚠️  No script sandboxing settings found in $file"
        fi
    fi
done

if [[ "$FOUND_MALICIOUS" == true ]]; then
    echo ""
    echo "❌ MALICIOUS CONTENT DETECTED! Build blocked."
    echo "Please remove any suspicious shell script phases before proceeding."
    exit 1
else
    echo ""
    echo "✅ Security scan completed successfully. No malicious content detected."
fi
