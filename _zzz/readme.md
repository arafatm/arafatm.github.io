- [ ] http://freyr.websages.com/Life_Cycle_of_a_Silver_Bullet.pdf

[Coursera: Machine Learning Foundations](https://github.com/arafatm/edu_coursera_machine_learning_1_foundations)

[Udacity: Microservices with Kubernetes](https://github.com/arafatm/edu_udacity_scalable_microservices_with_kubernetes)

# Read a random note
find . -type d \( -name .git  \) -prune -o \( -name "*.mkd" -o -name "*.md" \) |shuf -n 1

# find a random doc to read
find . -type f | shuf -n 1
find . -type f -name "*.md" -not -path "./.git/*" |shuf -n 1
