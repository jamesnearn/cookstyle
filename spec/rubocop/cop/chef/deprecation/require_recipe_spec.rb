#
# Copyright:: 2019, Chef Software, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

require 'spec_helper'

describe RuboCop::Cop::Chef::RequireRecipe, :config do
  subject(:cop) { described_class.new(config) }

  it 'registers an offense when require_recipe is used' do
    expect_violation(<<-RUBY)
      require_recipe 'foo'
      ^^^^^^^^^^^^^^ Use include_recipe instead of the require_recipe method
    RUBY
  end

  it "doesn't register an offense when include_recipe is used" do
    expect_no_violations(<<-RUBY)
      include_recipe 'foo'
    RUBY
  end
end