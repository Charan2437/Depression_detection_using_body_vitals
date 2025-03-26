#!/bin/bash

# Set your repository path
REPO_PATH="your-repo-path"

# Number of commits to generate
NUM_COMMITS=50

# Navigate to your repository
cd "$REPO_PATH" || exit

# Ensure the repository is a Git repo
if [ ! -d .git ]; then
    echo "Error: Not a Git repository!"
    exit 1
fi

# List of meaningful commit messages related to depression detection using body vitals
COMMIT_MESSAGES=(
    "Added preprocessing for heart rate data"
    "Implemented feature extraction for oxygen levels"
    "Updated model architecture for better BP analysis"
    "Fine-tuned CNN for detecting depression patterns"
    "Enhanced data augmentation for vitals dataset"
    "Fixed bug in time-series analysis of HRV"
    "Refactored code for better real-time monitoring"
    "Optimized training pipeline for large datasets"
    "Added new metrics for depression severity classification"
    "Improved accuracy of model with latest dataset"
    "Tested new hyperparameters for better performance"
    "Integrated stress level estimation module"
    "Enhanced robustness of AI model to noise"
    "Added early stopping to prevent overfitting"
    "Cleaned dataset to remove noisy signals"
    "Implemented anomaly detection for vitals"
    "Updated visualization for vital sign trends"
    "Incorporated support for wearable device data"
    "Refined data collection process for ECG signals"
    "Ran experiments with new activation functions"
    "Validated model predictions with clinical data"
    "Improved feature selection for BP and HRV"
    "Created custom dataset split for training"
    "Updated loss function to reduce MAE"
    "Increased model efficiency with batch normalization"
    "Enhanced depression risk scoring mechanism"
    "Integrated AI-based pattern recognition for vitals"
    "Improved data synchronization for wearable inputs"
    "Tested model generalization on unseen datasets"
    "Analyzed correlation between HRV and depression"
)

# Loop to create random commits
for i in $(seq 1 $NUM_COMMITS)
do
    # Generate a random past date within the last year
    RANDOM_DAYS_AGO=$((RANDOM % 365))
    COMMIT_DATE=$(date -d "$RANDOM_DAYS_AGO days ago" --iso-8601)

    # Pick a random commit message from the list
    RANDOM_COMMIT_MSG=${COMMIT_MESSAGES[$RANDOM % ${#COMMIT_MESSAGES[@]}]}

    # Make a dummy change
    echo "$RANDOM_COMMIT_MSG - $COMMIT_DATE" >> commit-history.txt
    git add commit-history.txt

    # Commit with the fake date
    GIT_COMMITTER_DATE="$COMMIT_DATE 12:00:00" git commit -m "$RANDOM_COMMIT_MSG" --date "$COMMIT_DATE 12:00:00"

    echo "Committed on: $COMMIT_DATE -> Message: $RANDOM_COMMIT_MSG"
done

# Push to GitHub
git push origin main
